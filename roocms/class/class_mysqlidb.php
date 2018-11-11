<?php
/**
 * RooCMS - Open Source Free Content Managment System
 * @copyright © 2010-2018 alexandr Belov aka alex Roosso. All rights reserved.
 * @author    alex Roosso <info@roocms.com>
 * @link      http://www.roocms.com
 * @license   http://www.gnu.org/licenses/gpl-3.0.html
 *
 * You should have received a copy of the GNU General Public License v3
 * along with this program.  If not, see http://www.gnu.org/licenses/
 */


//#########################################################
// Anti Hack
//---------------------------------------------------------
if(!defined('RooCMS')) {
	die('Access Denied');
}
//#########################################################


/**
 * Class MySQLDatabase
 */
class MySQLiDB extends MySQLiDBExtends {

	# obj
	private $sql;

	private	$querys = [];

	public	$db_connect 	= false;	# [bool]	Флаг состояния подключения к БД
	public	$cnt_querys 	= 0;		# [int] 	Счетчик запросов в БД


	/**
	* Let's begin
	*
	*/
	public function __construct() {

		global $db_info;

		if(trim($db_info['host']) != "" && trim($db_info['base']) != "") {
			$this->connect($db_info['host'], $db_info['user'], $db_info['pass'], $db_info['base']);
		}
	}


	/**
	* Коннектимся к БД
	*
	* @param string $host - Хост
	* @param string $user - Пользователь БД
	* @param string $pass - Пароль для доступа к БД
	* @param string $base - Название БД
	*/
	private function connect($host, $user, $pass, $base) {

		$this->sql = new mysqli($host,$user,$pass, $base);

		if($this->sql->connect_errno == 0) {
			$this->db_connect = true;

			# set mysql charset
			$this->charset();
		}
		else {
			exit($this->error());
		}
	}


	/**
	* Проверяем подключение к БД сайта
	*
	* @param string $host - Хост
	* @param string $user - Пользователь БД
	* @param string $pass - Пароль для доступа к БД
	* @param string $base - Название БД
	*
	* @return boolean
	*/
	public function check_connect($host, $user, $pass, $base) {

		error_reporting(0);
		$this->sql = new mysqli($host,$user,$pass, $base);
		error_reporting(E_ALL);

		if($this->sql->connect_errno != 0) {
			return false;
		}
		else {
			if(defined('INSTALL')) {
				$this->db_connect = true;
			}
			return true;
		}
	}


	/**
	* Установка кодировок для соединения с БД
	* Некоторые версии MySQL неправильно работают с кодировками.
	* Эта функция помогает устранить ошибки в работе.
	* Стоит помнить, что это все таки 3 запроса к БД на каждую страницу и вызов.
	* Поэтому если БД работает стабильно, лучше выключить данную функцию.
	*/
	private function charset() {
		if($this->sql->character_set_name() != "utf8") {
			$this->sql->set_charset("utf8");

			# alternative
			if(!$this->sql->set_charset("utf8")) {
				$this->sql->query('set names utf8');
			}
		}
	}


	/**
	* Парсер ошибок запросов к БД
	* Функция используется для отладки запросов
	*
	* @param string $q - Запрос осуществленный к БД
	* @return string|null при влключенном режиме отладки вернет ошибку, иначе выведет общее сообщение на экран об ошибке
	*/
	private function error($q = "") {

		# режим отладки
		if(DEBUGMODE && $q!="") {
			$query = "<div style='padding: 5px;text-align: left;'><span style='font-family: Verdana, Tahoma; font-size: 12px;text-align: left;'>
			Ошибка БД [MySQL Error]: <b>".$this->sql->errno."</b>
			<br /> &bull; ".$this->sql->error."
			<br />
			<br />
			<table width='100%' style='border: 1px solid #ffdd00; background-color: #ffffee;text-align: left;'>
				<tr>
					<td align='left' style='text-align: left;font-family: Tahoma; font-size: 11px;color: #990000;'>
						<b>SQL Запрос:</b> <pre>{$q}</pre>
					</td>
				</tr>
			</table>
			</span></div>";

			return $query;
		}
		# рабочий режим выводим заглушку
		else {
			echo file_read(_SKIN."/db_error.tpl");
		}
	}


	/**
	* Запрос в БД
	*
	* @param string $q - Строка запроса в БД
	* @return resource - результат запроса.
	*/
	public function query($q = "") {

		global $debug;

		if($this->db_connect || DEBUGMODE) {

			# таймер старт
			$start = microtime(true);

			# Выполняем запрос
			$query = $this->sql->query($q) or die ($this->error($q));

			# таймер стоп
			$finish = microtime(true);

			# Считаем запросы
			$this->cnt_querys++;

			# сохраняем информацию о запросах
			$this->querys[] = $q;

			# Выводим информацию по всем запросам
			if($debug->show_debug) {

				# parse debug
				$q = strtr($q, array(
					'SELECT' 	=> '<b>SELECT</b>',
					'INSERT' 	=> '<b>INSERT</b>',
					'UPDATE' 	=> '<b>UPDATE</b>',
					'DELETE' 	=> '<b>DELETE</b>',
					'INTO' 		=> '<b>INTO</b>',
					'FROM' 		=> '<b>FROM</b>',
					'LEFT' 		=> '<b>LEFT</b>',
					'JOIN' 		=> '<b>JOIN</b>',
					'AS' 		=> '<b>AS</b>',
					'ON' 		=> '<b>ON</b>',
					'WHERE' 	=> '<b>WHERE</b>',
					'ORDER' 	=> '<b>ORDER</b>',
					'BY' 		=> '<b>BY</b>',
					'LIMIT' 	=> '<b>LIMIT</b>'
				));

				# debug info querys
				if($this->cnt_querys != 1) {
					$debug->debug_info .= "<hr>";
				}

				$timequery = $finish-$start;

				$debug->debug_info .= "<blockquote class='col-xs-12'>
							    <small>Запрос <b>#".$this->cnt_querys."</b></small>
							    <span class='text-danger'>{$q}</span>
							    <br /><small><span class='label label-info'>Timer: {$timequery}</span></small>
						       </blockquote>";
			}

			return $query;
		}
	}


	/**
	* Функция вставляет данные из массива в указанную таблицу.
	* Не рекомендуется использовать данную функцию в пользовательской части CMS
	*
	* @param array $array  - Массива данных, где ключ это имя поля в таблице а значение данные этого поля.
	* @param string $table - Название целевой таблицы.
	*/
	public function insert_array(array $array, $table) {

		$fields	= "";
		$values	= "";

		foreach($array AS $key=>$value) {

			if(trim($fields) != "")	{
				$fields .= ", ";
			}
			$fields .= $key;

			if(trim($values) != "") {
				$values .= ", ";
			}
			$values .= "'".$value."'";
		}

		$q = "INSERT INTO {$table} ({$fields}) VALUES ({$values})";

		$this->query($q);
	}


	/**
	 * Функция обновляет данные из массива в указанную таблицу.
	 * Не рекомендуется использовать данную функцию в пользовательской части CMS
	 *
	 * @param array $array    - Массив данных, где ключ это имя поля в таблице а значение данные этого поля.
	 * @param string $table   - Название целевой таблицы.
	 * @param string $proviso - Условие (фильтр) для отборо целевых строк таблицы
	 */
	public function update_array(array $array, $table, $proviso) {

		$update = "";
		foreach($array AS $key=>$value) {

			if(trim($update) != "") {
				$update .= ", ";
			}
			$update .= $key."='".$value."'";
		}

		$q = "UPDATE {$table} SET {$update} WHERE {$proviso}";

		$this->query($q);
	}


	/**
	 * Преобразует результаты запроса в простой массив
	 *
	 * @param mixed $q - Результат произведенного в БД запроса.
	 * @return array  - Возвращает данные из БД в ввиде нумерованного массива
	 */
	public function fetch_row($q) {

		if($this->db_connect || DEBUGMODE) {
			$result = mysqli_fetch_row($q);
			return $result;
		}
	}


	/**
	 * Преобразует результаты запроса в ассоциативный массив
	 *
	 * @param data $q - Результат произведенного в БД запроса.
	 * @return array|null  - Возвращает данные из БД в ввиде ассоциативного массива
	 */
	public function fetch_assoc($q) {

		if($this->db_connect || DEBUGMODE) {
			$result = mysqli_fetch_assoc($q);
			return $result;
		}
	}


	/**
	 * Преобразует результаты запроса в объект
	 *
	 * @param  data     $q - Результат произведенного в БД запроса.
	 * @return object|null - Возвращает данные из БД в ввиде объекта
	 */
	public function fetch_object($q) {

		if($this->db_connect || DEBUGMODE) {
			$obj = mysqli_fetch_object($q);
			return $obj;
		}
	}


	/**
	 * Have a index query
	 * @return int Возвращает идентификатор
	 */
	public function insert_id() {

		if($this->db_connect || DEBUGMODE) {
			$id = $this->sql->insert_id;
			return $id;
		}
	}


	/**
	 * Функция проверяет имеется ли запрашиваймый id.
	 *
	 * @param string      $id
	 * @param string      $table   - таблица в которой проводится проверка
	 * @param string      $field   - название поля таблицы содержащий идентификатор
	 * @param string|null $proviso - Дополнительное условие (фильтр) для проверки
	 *
	 * @return int|boolean - Возвращает количество найденных строк, соответсвующих критериям или false в случае неудачи
	 */
	public function check_id($id, $table, $field="id", $proviso=NULL) {

		static $results = [];

		if($field == "id") {
			$id = round($id);
		}

		# more proviso
		if(trim($proviso) != "") {
			$proviso = " AND ".$proviso;
		}

		$res = $this->count($table, "{$field}='{$id}' {$proviso}");


		return $res > 0;
	}


	/**
	 * Функция проверяет имеется ли список запрашиваемых id.
	 * И возвращает ввиде массива список найденых или false
	 *
	 * @param array       $ids     - массив с идентификаторами
	 * @param string      $table   - таблица в которой проводится проверка
	 * @param string      $field   - название поля таблицы содержащий идентификатор
	 * @param string|null $proviso - Дополнительное условие (фильтр) для проверки
	 *
	 * @return array $result  - Возвращает массив с подмассивом данных. Название подмассивая такое же как у проверяемого значения.
	 *                          Подмассив содержит ключи: check булево с результатом проверки значения.
	 *                          Ключ value будет содержать название проверяемого значения
	 *                          Ключ id_title будет содержать название поля главного индекса таблицы с данными, в которой выполнялась проверка
	 *                          Ключ id_value будет содержать значение главного индекса из строки которая обозначена как найденая.
	 */
	public function check_array_ids(array $ids, $table, $field="id", $proviso=NULL) {

		# write condition
		$primcond = "(";
		foreach($ids AS $value) {
			if($primcond != "(") {
				$primcond .= " OR ";
			}
			$primcond .= " ".$field."='".$value."' ";
		}
		$primcond .= ")";

		# more proviso
		if(trim($proviso) != "") {
			$proviso = " AND ".$proviso;
		}

		# Получаем primary key
		$pkey = $this->identy_primary_key($table);

		# query
		$data = [];
		$q = $this->query("SELECT ".$field.", ".$pkey." FROM ".$table." WHERE ".$primcond.$proviso);
		while($row = $this->fetch_assoc($q)) {
			$data[$row[$pkey]] = $row[$field];
		}

		# work result
		$result = [];
		foreach($ids AS $k=>$value) {

			$result[$value]['value'] = $value;

			if(in_array($value, $data)) {
				$result[$value]['check'] = true;
				$result[$value]['id_title'] = $pkey;
				$result[$value]['id_value'] = array_search($value, $data);
			}
			else {
				$result[$value]['check'] = false;
			}
		}

		return $result;
	}


	/**
	 * Функция обработчик Count()
	 *
	 * @param string $from    - таблица где ведеться подсчет
	 * @param string $proviso - условие для подсчета
	 *
	 * @return int
	 */
	public function count($from, $proviso) {

		static $results = [];

		# считаем
		$query = "SELECT count(*) FROM ".$from." WHERE ".$proviso;
		$rkey = md5($query);

		# проверяем результат
		$c = [];
		if(!array_key_exists($rkey, $results)) {
			# check in DB
			$q = $this->query($query);

			$c = $this->fetch_row($q);
			$results[$rkey] = $c[0];
		}
		else {
			$c[0] = $results[$rkey];
		}

		return $c[0];
	}


	/**
	 * Функция указывает какое кол-во строк вернул запрос
	 * Работает только с Select и Show
	 *
	 * @param string $q - запрос
	 *
	 * @return int
	 */
	public function num_rows($q) {
		return mysqli_num_rows($q);
	}


	/**
	 * Функция указывает какое кол-во строк были затронуты последним запросом
	 * Работает только с Insert и Update
	 *
	 * @return int
	 */
	public function affected_rows() {
		return $this->sql->affected_rows;
	}


	/**
	 * Clear system symbols for query
	 *
	 * @param string $q - запрос
	 * @return string - возвращает строку запроса в бд вычещенной
	 */
	public function escape_string($q) {

		$q = htmlspecialchars($q);
		$q = strtr($q, array(
		        '{' 		=> '&#123;',
		        '}' 		=> '&#125;',
		        '$' 		=> '&#36;',
		        '&amp;gt;' 	=> '&gt;',
		        "'"		=> "&#39;"
		));

		if($this->db_connect) {
			return $this->sql->real_escape_string($q);
		}
		else {
			return $q;
		}
	}


	/**
	 * Функция находит название главного ключа таблицы.
	 *
	 * @param string $table - имя таблицы БД
	 *
	 * @return mixed|null - название столбца с главным ключом таблицы.
	 */
	private function identy_primary_key($table) {

		$index = NULL;
		$q = $this->query("SHOW INDEX FROM ".$table);
		while($data = $this->fetch_assoc($q)) {
			if($data['Key_name'] == "PRIMARY") {
				$index = $data['Column_name'];
				break;
			}
		}

		return $index;
	}


	/**
	 * ERRNO
	 *
	 * @param bool $error
	 *
	 * @return mixed
	 */
	public function errno($error=false) {
		if(defined('INSTALL') || defined('UPDATE')) {
			if($error) {
				return $this->sql->error;
			}
			else {
				return $this->sql->errno;
			}
		}

	}


	/**
	 * Закрываем подключение к БД сайта
	 *
	 */
	public function close() {
		if(is_object($this->sql) && $this->sql->connect_errno == 0) {
			$this->sql->close();
		}
	}
}