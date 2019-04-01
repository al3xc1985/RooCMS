{* Module template: last_feed *}
<div class="card-columns">
{foreach from=$feeds item=feed name=lastfeed}
	<div class="card mb-3">
		{if isset($feed['image'][0])}
			{foreach from=$feed['image'] item=image}
				<img src="upload/images/{$image['thumb']}" class="card-img-top" alt="{$image['alt']}">
			{/foreach}
		{else}
			<img src='data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="680" height="452"><path d="M336,206L408,155L308,135Z" fill="#f8ded2" stroke="#f8ded2" stroke-width="1.51"/><path d="M408,155L349,100L308,135Z" fill="#f5c8b7" stroke="#f5c8b7" stroke-width="1.51"/><path d="M336,206L427,173L408,155Z" fill="#eee1da" stroke="#eee1da" stroke-width="1.51"/><path d="M308,135L256,132L336,206Z" fill="#fbd2bf" stroke="#fbd2bf" stroke-width="1.51"/><path d="M267,37L256,132L308,135Z" fill="#f1a790" stroke="#f1a790" stroke-width="1.51"/><path d="M336,206L420,246L427,173Z" fill="#eaebeb" stroke="#eaebeb" stroke-width="1.51"/><path d="M420,246L447,248L427,173Z" fill="#dbe7ef" stroke="#dbe7ef" stroke-width="1.51"/><path d="M427,173L454,73L408,155Z" fill="#dfbfb4" stroke="#dfbfb4" stroke-width="1.51"/><path d="M408,155L454,73L349,100Z" fill="#e3b2a7" stroke="#e3b2a7" stroke-width="1.51"/><path d="M537,110L454,73L427,173Z" fill="#cbaba6" stroke="#cbaba6" stroke-width="1.51"/><path d="M349,100L267,37L308,135Z" fill="#eea694" stroke="#eea694" stroke-width="1.51"/><path d="M304,11L267,37L349,100Z" fill="#e08c81" stroke="#e08c81" stroke-width="1.51"/><path d="M420,246L443,314L447,248Z" fill="#c5deec" stroke="#c5deec" stroke-width="1.51"/><path d="M336,206L397,303L420,246Z" fill="#e0ecf3" stroke="#e0ecf3" stroke-width="1.51"/><path d="M256,272L397,303L336,206Z" fill="#e9eef1" stroke="#e9eef1" stroke-width="1.51"/><path d="M237,259L256,272L336,206Z" fill="#f3e6df" stroke="#f3e6df" stroke-width="1.51"/><path d="M401,4L304,11L349,100Z" fill="#d78c88" stroke="#d78c88" stroke-width="1.51"/><path d="M173,177L237,259L256,132Z" fill="#fac9b2" stroke="#fac9b2" stroke-width="1.51"/><path d="M256,132L237,259L336,206Z" fill="#fce1d2" stroke="#fce1d2" stroke-width="1.51"/><path d="M454,73L401,4L349,100Z" fill="#d6928e" stroke="#d6928e" stroke-width="1.51"/><path d="M267,37L216,54L256,132Z" fill="#e58a74" stroke="#e58a74" stroke-width="1.51"/><path d="M156,6L216,54L217,-53Z" fill="#ad544b" stroke="#ad544b" stroke-width="1.51"/><path d="M397,303L443,314L420,246Z" fill="#c1dceb" stroke="#c1dceb" stroke-width="1.51"/><path d="M423,367L443,314L397,303Z" fill="#a3cbe2" stroke="#a3cbe2" stroke-width="1.51"/><path d="M447,248L535,187L427,173Z" fill="#ccd8df" stroke="#ccd8df" stroke-width="1.51"/><path d="M544,315L535,187L447,248Z" fill="#accde2" stroke="#accde2" stroke-width="1.51"/><path d="M216,54L173,177L256,132Z" fill="#f19f7e" stroke="#f19f7e" stroke-width="1.51"/><path d="M454,73L443,-20L401,4Z" fill="#ae797f" stroke="#ae797f" stroke-width="1.51"/><path d="M535,187L537,110L427,173Z" fill="#c2b9bc" stroke="#c2b9bc" stroke-width="1.51"/><path d="M256,272L262,325L397,303Z" fill="#d4dde2" stroke="#d4dde2" stroke-width="1.51"/><path d="M237,259L262,325L256,272Z" fill="#e0d3ce" stroke="#e0d3ce" stroke-width="1.51"/><path d="M163,348L262,325L237,259Z" fill="#d0beb9" stroke="#d0beb9" stroke-width="1.51"/><path d="M401,4L333,-72L304,11Z" fill="#b37e82" stroke="#b37e82" stroke-width="1.51"/><path d="M549,9L443,-20L454,73Z" fill="#9c6f7a" stroke="#9c6f7a" stroke-width="1.51"/><path d="M537,110L555,96L454,73Z" fill="#b4898e" stroke="#b4898e" stroke-width="1.51"/><path d="M601,158L555,96L537,110Z" fill="#a88b97" stroke="#a88b97" stroke-width="1.51"/><path d="M173,177L152,235L237,259Z" fill="#f7c5b3" stroke="#f7c5b3" stroke-width="1.51"/><path d="M89,247L152,235L173,177Z" fill="#efab9c" stroke="#efab9c" stroke-width="1.51"/><path d="M638,198L601,158L535,187Z" fill="#a4a5be" stroke="#a4a5be" stroke-width="1.51"/><path d="M385,427L423,367L397,303Z" fill="#92bad9" stroke="#92bad9" stroke-width="1.51"/><path d="M217,-53L216,54L267,37Z" fill="#bb675c" stroke="#bb675c" stroke-width="1.51"/><path d="M350,-87L333,-72L401,4Z" fill="#b07d81" stroke="#b07d81" stroke-width="1.51"/><path d="M555,96L549,9L454,73Z" fill="#a9747e" stroke="#a9747e" stroke-width="1.51"/><path d="M443,-20L350,-87L401,4Z" fill="#a7797f" stroke="#a7797f" stroke-width="1.51"/><path d="M482,-82L350,-87L443,-20Z" fill="#9f747d" stroke="#9f747d" stroke-width="1.51"/><path d="M535,187L601,158L537,110Z" fill="#aca1ad" stroke="#aca1ad" stroke-width="1.51"/><path d="M555,96L638,87L549,9Z" fill="#976077" stroke="#976077" stroke-width="1.51"/><path d="M544,315L447,248L443,314Z" fill="#a2cce2" stroke="#a2cce2" stroke-width="1.51"/><path d="M548,395L544,315L443,314Z" fill="#6ba9cf" stroke="#6ba9cf" stroke-width="1.51"/><path d="M262,325L273,392L397,303Z" fill="#b8cbd9" stroke="#b8cbd9" stroke-width="1.51"/><path d="M200,382L273,392L262,325Z" fill="#adaab7" stroke="#adaab7" stroke-width="1.51"/><path d="M216,54L109,82L173,177Z" fill="#e27b60" stroke="#e27b60" stroke-width="1.51"/><path d="M217,-53L267,37L304,11Z" fill="#b36e68" stroke="#b36e68" stroke-width="1.51"/><path d="M217,-53L304,11L333,-72Z" fill="#b47471" stroke="#b47471" stroke-width="1.51"/><path d="M203,-117L217,-53L333,-72Z" fill="#b26a63" stroke="#b26a63" stroke-width="1.51"/><path d="M156,6L109,82L216,54Z" fill="#cb5045" stroke="#cb5045" stroke-width="1.51"/><path d="M549,9L482,-82L443,-20Z" fill="#856474" stroke="#856474" stroke-width="1.51"/><path d="M152,235L163,348L237,259Z" fill="#e0b8ae" stroke="#e0b8ae" stroke-width="1.51"/><path d="M89,247L163,348L152,235Z" fill="#dba29a" stroke="#dba29a" stroke-width="1.51"/><path d="M423,367L548,395L443,314Z" fill="#73aed2" stroke="#73aed2" stroke-width="1.51"/><path d="M273,392L385,427L397,303Z" fill="#9ebbda" stroke="#9ebbda" stroke-width="1.51"/><path d="M163,348L200,382L262,325Z" fill="#b6a4a8" stroke="#b6a4a8" stroke-width="1.51"/><path d="M273,392L360,459L385,427Z" fill="#909ec0" stroke="#909ec0" stroke-width="1.51"/><path d="M73,121L89,247L173,177Z" fill="#e89581" stroke="#e89581" stroke-width="1.51"/><path d="M109,82L73,121L173,177Z" fill="#df755d" stroke="#df755d" stroke-width="1.51"/><path d="M25,86L73,121L109,82Z" fill="#c7473f" stroke="#c7473f" stroke-width="1.51"/><path d="M601,158L638,87L555,96Z" fill="#a17a8e" stroke="#a17a8e" stroke-width="1.51"/><path d="M544,315L638,198L535,187Z" fill="#9db8d8" stroke="#9db8d8" stroke-width="1.51"/><path d="M549,9L614,-48L482,-82Z" fill="#6f516b" stroke="#6f516b" stroke-width="1.51"/><path d="M638,198L638,87L601,158Z" fill="#9d859a" stroke="#9d859a" stroke-width="1.51"/><path d="M230,463L360,459L273,392Z" fill="#8f8ca4" stroke="#8f8ca4" stroke-width="1.51"/><path d="M528,474L548,395L423,367Z" fill="#5288bc" stroke="#5288bc" stroke-width="1.51"/><path d="M458,500L423,367L385,427Z" fill="#738fb6" stroke="#738fb6" stroke-width="1.51"/><path d="M544,315L634,337L638,198Z" fill="#7da1cd" stroke="#7da1cd" stroke-width="1.51"/><path d="M200,382L230,463L273,392Z" fill="#9f8ca3" stroke="#9f8ca3" stroke-width="1.51"/><path d="M163,348L176,410L200,382Z" fill="#a78795" stroke="#a78795" stroke-width="1.51"/><path d="M56,348L176,410L163,348Z" fill="#a47784" stroke="#a47784" stroke-width="1.51"/><path d="M37,9L25,86L109,82Z" fill="#b1252f" stroke="#b1252f" stroke-width="1.51"/><path d="M217,-53L119,-88L156,6Z" fill="#a4433f" stroke="#a4433f" stroke-width="1.51"/><path d="M350,-87L203,-117L333,-72Z" fill="#b47774" stroke="#b47774" stroke-width="1.51"/><path d="M523,-137L203,-117L350,-87Z" fill="#b07d81" stroke="#b07d81" stroke-width="1.51"/><path d="M638,87L614,-48L549,9Z" fill="#744666" stroke="#744666" stroke-width="1.51"/><path d="M176,410L230,463L200,382Z" fill="#9c7c8e" stroke="#9c7c8e" stroke-width="1.51"/><path d="M548,395L634,337L544,315Z" fill="#4a8fc2" stroke="#4a8fc2" stroke-width="1.51"/><path d="M176,410L163,470L230,463Z" fill="#8a6371" stroke="#8a6371" stroke-width="1.51"/><path d="M89,247L70,330L163,348Z" fill="#c38d8c" stroke="#c38d8c" stroke-width="1.51"/><path d="M56,348L70,330L11,289Z" fill="#a5727b" stroke="#a5727b" stroke-width="1.51"/><path d="M73,121L-4,119L89,247Z" fill="#d17365" stroke="#d17365" stroke-width="1.51"/><path d="M37,9L109,82L156,6Z" fill="#b02b31" stroke="#b02b31" stroke-width="1.51"/><path d="M482,-82L523,-137L350,-87Z" fill="#956e7a" stroke="#956e7a" stroke-width="1.51"/><path d="M614,-48L523,-137L482,-82Z" fill="#71546c" stroke="#71546c" stroke-width="1.51"/><path d="M203,-117L119,-88L217,-53Z" fill="#a74b44" stroke="#a74b44" stroke-width="1.51"/><path d="M634,337L676,298L638,198Z" fill="#7590b7" stroke="#7590b7" stroke-width="1.51"/><path d="M731,176L695,55L638,87Z" fill="#845262" stroke="#845262" stroke-width="1.51"/><path d="M638,87L695,55L614,-48Z" fill="#713754" stroke="#713754" stroke-width="1.51"/><path d="M360,459L458,500L385,427Z" fill="#7385a7" stroke="#7385a7" stroke-width="1.51"/><path d="M230,463L338,508L360,459Z" fill="#8786a0" stroke="#8786a0" stroke-width="1.51"/><path d="M119,-88L37,9L156,6Z" fill="#95242e" stroke="#95242e" stroke-width="1.51"/><path d="M731,176L638,87L638,198Z" fill="#8f7586" stroke="#8f7586" stroke-width="1.51"/><path d="M11,289L70,330L89,247Z" fill="#bf8183" stroke="#bf8183" stroke-width="1.51"/><path d="M70,330L56,348L163,348Z" fill="#ac7881" stroke="#ac7881" stroke-width="1.51"/><path d="M548,395L610,418L634,337Z" fill="#3076b5" stroke="#3076b5" stroke-width="1.51"/><path d="M415,551L458,500L360,459Z" fill="#7084a6" stroke="#7084a6" stroke-width="1.51"/><path d="M458,500L528,474L423,367Z" fill="#567ba3" stroke="#567ba3" stroke-width="1.51"/><path d="M634,337L722,427L676,298Z" fill="#306495" stroke="#306495" stroke-width="1.51"/><path d="M25,86L-4,119L73,121Z" fill="#b64942" stroke="#b64942" stroke-width="1.51"/><path d="M-26,45L-4,119L25,86Z" fill="#9b2f33" stroke="#9b2f33" stroke-width="1.51"/><path d="M591,470L610,418L548,395Z" fill="#24629f" stroke="#24629f" stroke-width="1.51"/><path d="M56,348L163,470L176,410Z" fill="#97617a" stroke="#97617a" stroke-width="1.51"/><path d="M230,463L301,531L338,508Z" fill="#898399" stroke="#898399" stroke-width="1.51"/><path d="M-42,240L11,289L89,247Z" fill="#b67f83" stroke="#b67f83" stroke-width="1.51"/><path d="M675,-54L623,-100L614,-48Z" fill="#5a3254" stroke="#5a3254" stroke-width="1.51"/><path d="M614,-48L623,-100L523,-137Z" fill="#674465" stroke="#674465" stroke-width="1.51"/><path d="M740,237L731,176L638,198Z" fill="#88869f" stroke="#88869f" stroke-width="1.51"/><path d="M338,508L415,551L360,459Z" fill="#7c89a8" stroke="#7c89a8" stroke-width="1.51"/><path d="M185,545L301,531L230,463Z" fill="#8b7384" stroke="#8b7384" stroke-width="1.51"/><path d="M695,55L675,-54L614,-48Z" fill="#522848" stroke="#522848" stroke-width="1.51"/><path d="M760,9L675,-54L695,55Z" fill="#4f2240" stroke="#4f2240" stroke-width="1.51"/><path d="M528,474L591,470L548,395Z" fill="#265f93" stroke="#265f93" stroke-width="1.51"/><path d="M754,268L740,237L676,298Z" fill="#7385a7" stroke="#7385a7" stroke-width="1.51"/><path d="M549,529L591,470L528,474Z" fill="#245c8f" stroke="#245c8f" stroke-width="1.51"/><path d="M754,268L676,298L813,360Z" fill="#57789f" stroke="#57789f" stroke-width="1.51"/><path d="M676,298L740,237L638,198Z" fill="#7d89a8" stroke="#7d89a8" stroke-width="1.51"/><path d="M119,-88L28,-67L37,9Z" fill="#880925" stroke="#880925" stroke-width="1.51"/><path d="M37,9L-26,45L25,86Z" fill="#930f27" stroke="#930f27" stroke-width="1.51"/><path d="M-1,-70L28,-67L119,-88Z" fill="#810624" stroke="#810624" stroke-width="1.51"/><path d="M740,237L749,211L731,176Z" fill="#8787a1" stroke="#8787a1" stroke-width="1.51"/><path d="M731,176L772,59L695,55Z" fill="#824c5d" stroke="#824c5d" stroke-width="1.51"/><path d="M-4,119L-42,240L89,247Z" fill="#bd7b78" stroke="#bd7b78" stroke-width="1.51"/><path d="M-50,-11L-26,45L37,9Z" fill="#720321" stroke="#720321" stroke-width="1.51"/><path d="M301,531L415,551L338,508Z" fill="#818ba9" stroke="#818ba9" stroke-width="1.51"/><path d="M458,500L549,529L528,474Z" fill="#3d6a97" stroke="#3d6a97" stroke-width="1.51"/><path d="M-19,402L84,509L56,348Z" fill="#743d5c" stroke="#743d5c" stroke-width="1.51"/><path d="M170,539L185,545L163,470Z" fill="#865967" stroke="#865967" stroke-width="1.51"/><path d="M-107,152L-42,240L-4,119Z" fill="#b36c65" stroke="#b36c65" stroke-width="1.51"/><path d="M722,427L634,337L610,418Z" fill="#1f5a97" stroke="#1f5a97" stroke-width="1.51"/><path d="M740,237L754,268L749,211Z" fill="#7f8aa9" stroke="#7f8aa9" stroke-width="1.51"/><path d="M733,473L722,427L610,418Z" fill="#09376b" stroke="#09376b" stroke-width="1.51"/><path d="M503,590L549,529L458,500Z" fill="#426d98" stroke="#426d98" stroke-width="1.51"/><path d="M28,-67L-1,-70L37,9Z" fill="#720321" stroke="#720321" stroke-width="1.51"/><path d="M-125,-116L-1,-70L119,-88Z" fill="#67001f" stroke="#67001f" stroke-width="1.51"/><path d="M163,470L185,545L230,463Z" fill="#88626f" stroke="#88626f" stroke-width="1.51"/><path d="M301,531L91,590L415,551Z" fill="#8a7f92" stroke="#8a7f92" stroke-width="1.51"/><path d="M170,539L163,470L84,509Z" fill="#80495a" stroke="#80495a" stroke-width="1.51"/><path d="M84,509L163,470L56,348Z" fill="#7e4157" stroke="#7e4157" stroke-width="1.51"/><path d="M811,110L731,176L749,211Z" fill="#8a7788" stroke="#8a7788" stroke-width="1.51"/><path d="M811,110L772,59L731,176Z" fill="#865967" stroke="#865967" stroke-width="1.51"/><path d="M772,59L760,9L695,55Z" fill="#6e2c46" stroke="#6e2c46" stroke-width="1.51"/><path d="M675,-54L744,-126L623,-100Z" fill="#4c213f" stroke="#4c213f" stroke-width="1.51"/><path d="M-26,45L-107,152L-4,119Z" fill="#a3403d" stroke="#a3403d" stroke-width="1.51"/><path d="M-1,-70L-50,-11L37,9Z" fill="#67001f" stroke="#67001f" stroke-width="1.51"/><path d="M170,539L91,590L185,545Z" fill="#824e5e" stroke="#824e5e" stroke-width="1.51"/><path d="M-19,402L56,348L11,289Z" fill="#835f71" stroke="#835f71" stroke-width="1.51"/><path d="M-109,271L-19,402L11,289Z" fill="#896776" stroke="#896776" stroke-width="1.51"/><path d="M733,473L610,418L591,470Z" fill="#0c3d74" stroke="#0c3d74" stroke-width="1.51"/><path d="M646,555L733,473L591,470Z" fill="#0a396d" stroke="#0a396d" stroke-width="1.51"/><path d="M415,551L503,590L458,500Z" fill="#5a7aa0" stroke="#5a7aa0" stroke-width="1.51"/><path d="M91,590L503,590L415,551Z" fill="#848ba8" stroke="#848ba8" stroke-width="1.51"/><path d="M813,360L811,110L754,268Z" fill="#7c89a8" stroke="#7c89a8" stroke-width="1.51"/><path d="M754,268L811,110L749,211Z" fill="#89849b" stroke="#89849b" stroke-width="1.51"/><path d="M772,59L811,110L760,9Z" fill="#76364c" stroke="#76364c" stroke-width="1.51"/><path d="M-101,29L-107,152L-26,45Z" fill="#972930" stroke="#972930" stroke-width="1.51"/><path d="M-42,240L-109,271L11,289Z" fill="#a7787f" stroke="#a7787f" stroke-width="1.51"/><path d="M-50,-11L-101,29L-26,45Z" fill="#780422" stroke="#780422" stroke-width="1.51"/><path d="M-124,-9L-101,29L-50,-11Z" fill="#690020" stroke="#690020" stroke-width="1.51"/><path d="M-133,244L-109,271L-42,240Z" fill="#ac7b80" stroke="#ac7b80" stroke-width="1.51"/><path d="M774,-100L675,-54L760,9Z" fill="#4c213f" stroke="#4c213f" stroke-width="1.51"/><path d="M774,-100L744,-126L675,-54Z" fill="#4c213f" stroke="#4c213f" stroke-width="1.51"/><path d="M623,-100L744,-126L523,-137Z" fill="#5d3558" stroke="#5d3558" stroke-width="1.51"/><path d="M-60,524L-22,471L-107,473Z" fill="#4c213f" stroke="#4c213f" stroke-width="1.51"/><path d="M-19,402L-22,471L84,509Z" fill="#542441" stroke="#542441" stroke-width="1.51"/><path d="M811,110L774,-100L760,9Z" fill="#512340" stroke="#512340" stroke-width="1.51"/><path d="M722,427L813,360L676,298Z" fill="#275f91" stroke="#275f91" stroke-width="1.51"/><path d="M646,555L591,470L549,529Z" fill="#194f88" stroke="#194f88" stroke-width="1.51"/><path d="M503,590L646,555L549,529Z" fill="#21588d" stroke="#21588d" stroke-width="1.51"/><path d="M-107,473L-22,471L-19,402Z" fill="#4e2341" stroke="#4e2341" stroke-width="1.51"/><path d="M-107,152L-133,244L-42,240Z" fill="#b57b7b" stroke="#b57b7b" stroke-width="1.51"/><path d="M-124,-9L-133,244L-107,152Z" fill="#aa524a" stroke="#aa524a" stroke-width="1.51"/><path d="M788,451L813,360L722,427Z" fill="#114781" stroke="#114781" stroke-width="1.51"/><path d="M-60,524L91,590L84,509Z" fill="#612844" stroke="#612844" stroke-width="1.51"/><path d="M84,509L91,590L170,539Z" fill="#7b4053" stroke="#7b4053" stroke-width="1.51"/><path d="M185,545L91,590L301,531Z" fill="#88616f" stroke="#88616f" stroke-width="1.51"/><path d="M-101,29L-124,-9L-107,152Z" fill="#901a29" stroke="#901a29" stroke-width="1.51"/><path d="M-125,-116L-124,-9L-50,-11Z" fill="#67001f" stroke="#67001f" stroke-width="1.51"/><path d="M733,473L788,451L722,427Z" fill="#053162" stroke="#053162" stroke-width="1.51"/><path d="M766,585L788,451L733,473Z" fill="#053061" stroke="#053061" stroke-width="1.51"/><path d="M-124,-9L-147,392L-133,244Z" fill="#b47a7a" stroke="#b47a7a" stroke-width="1.51"/><path d="M-1,-70L-125,-116L-50,-11Z" fill="#67001f" stroke="#67001f" stroke-width="1.51"/><path d="M203,-117L-125,-116L119,-88Z" fill="#8a0a25" stroke="#8a0a25" stroke-width="1.51"/><path d="M523,-137L-125,-116L203,-117Z" fill="#ac554c" stroke="#ac554c" stroke-width="1.51"/><path d="M-22,471L-60,524L84,509Z" fill="#4d213f" stroke="#4d213f" stroke-width="1.51"/><path d="M-147,392L-19,402L-109,271Z" fill="#74566d" stroke="#74566d" stroke-width="1.51"/><path d="M-133,244L-147,392L-109,271Z" fill="#936e7a" stroke="#936e7a" stroke-width="1.51"/><path d="M-125,-116L-147,392L-124,-9Z" fill="#9d3335" stroke="#9d3335" stroke-width="1.51"/><path d="M503,590L727,576L646,555Z" fill="#10457e" stroke="#10457e" stroke-width="1.51"/><path d="M646,555L727,576L733,473Z" fill="#053061" stroke="#053061" stroke-width="1.51"/><path d="M-147,392L-107,473L-19,402Z" fill="#5b3355" stroke="#5b3355" stroke-width="1.51"/><path d="M727,576L766,585L733,473Z" fill="#053061" stroke="#053061" stroke-width="1.51"/><path d="M788,451L766,585L813,360Z" fill="#053061" stroke="#053061" stroke-width="1.51"/><path d="M503,590L766,585L727,576Z" fill="#083569" stroke="#083569" stroke-width="1.51"/><path d="M-107,473L-100,579L-60,524Z" fill="#4c213f" stroke="#4c213f" stroke-width="1.51"/><path d="M-60,524L-100,579L91,590Z" fill="#4c213f" stroke="#4c213f" stroke-width="1.51"/><path d="M-147,392L-100,579L-107,473Z" fill="#4c213f" stroke="#4c213f" stroke-width="1.51"/></svg>' class="card-img-top" alt="{$feed['title']}">
		{/if}
		<div class="card-body">
			<h5 class="card-title">{$feed['title']}</h5>
			<p class="card-text"><small class="text-muted">{$feed['datepub']}</small><a href="{$SCRIPT_NAME}?page={$feed['alias']}&id={$feed['id']}" class="btn btn-sm btn-light mt-n1 float-right">Читать</a></p>
		</div>
	</div>
{/foreach}
</div>
