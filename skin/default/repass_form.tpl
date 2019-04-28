{* Template: recovery password *}
<div class="container mb-4">
	<div class="row">
		<div class="col-12">
			<h1>Восстановление пароля</h1>
		</div>
	</div>
	<form method="post" action="{$SCRIPT_NAME}?part=repass&act=reminder" role="form" class="needs-validation" novalidate>
		<div class="row">
			<div class="col-12">
				<div class="card card-body">
					<div class="form-group position-relative">
						<label for="inputEmail">
							Электронная почта:
						</label>

						<input type="text" name="email" id="inputEmail" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{literal}{2,6}{/literal}$" aria-describedby="emailHelp" required>
						<div class="invalid-tooltip">
							Укажите корректный e-mail который вы использовали для регистрации на сайте.
						</div>
						<small id="emailHelp" class="form-text text-gray">Адрес электронной почты, указанный Вами при регистрации на сайте. Для восстановления мы отправим на указанный адрес письмо, с инструкцией по восстановлению пароля.</small>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4">
					<div class="card-body text-center">
						{if $config->captcha_power}
							<div class="row mb-3">
								<div class="col-sm-6 text-center"><img src="/captcha.php" alt="Код для защиты от СПАМа"></div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="inputCaptcha">
											Защитный код: <i class="fas fa-question-circle fa-fw" rel="tooltip" title="Из-за множества программ для СПАМа и другого вредоносного софта, мы просим Вас пройти простую проверку, доказывающую, что за компьютером сидит человек..." data-placement="top"></i></small>
										</label>
										<input type="text" name="captcha" id="inputCaptcha" class="form-control" aria-describedby="captchaHelp" placeholder="" required>
										<small id="captchaHelp" class="form-text text-muted">Введите код с картинки (буквы и цифры), что бы помочь нам защититься от СПАМа</small>
									</div>
								</div>
							</div>
						{/if}
						<input type="submit" name="reminder" class="btn btn-lg btn-success btn-block" value="Восстановить пароль">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>