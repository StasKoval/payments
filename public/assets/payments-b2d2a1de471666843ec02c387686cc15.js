(function(){jQuery(function(){return $("#payment_payment_date").datepicker({dateFormat:"yy-mm-dd"})}),$(" .reveral").click(function(){return $("#myModal"+product_id).reveal()}),$("input:radio").change(function(){return alert("aaaa")}),$("form").on("click",".remove_fields",function(e){return $(this).prev("input[type=hidden]").val("1"),$(this).closest("fieldset").hide(),e.preventDefault()}),$("form").on("click",".add_fields",function(e){var t,n;return n=(new Date).getTime(),t=new RegExp($(this).data("id"),"g"),$(this).before($(this).data("fields").replace(t,n)),e.preventDefault()})}).call(this);