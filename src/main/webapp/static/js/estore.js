$(document).ready(function() {
	//thay đổi trong input
	$("tr[data-id] input").on("input", function() {
		var id = $(this).closest("tr").attr("data-id");
		var price = $(this).closest("tr").attr("data-price");
		var discount = $(this).closest("tr").attr("data-discount");
		var qty = $(this).val();
		
		$.ajax({
    		url:`/cart/update/${id}/${qty}`,
    		success:function(response){
    			$("#cart-cnt").html(response[0]);
    			$("#cart-amt").html(new Intl.NumberFormat('vi-VI', { style: 'currency', currency: 'VND' }).format(response[1]));
    		}
    	});
		var amount = qty*price*(1-discount);
		$(this).closest("tr").find(".amt").html(amount);
	});
	
	// xóa từng sản phẩm trong giỏ hàng
	$(".btn-cart-remove").click(function() {
		var id = $(this).closest("tr").attr("data-id");
		$.ajax({
    		url:"/cart/remove/"+id,
    		success:function(response){
    			$("#cart-cnt").html(response[0]);
    			$("#cart-amt").html(new Intl.NumberFormat('vi-VI', { style: 'currency', currency: 'VND' }).format(response[1]));
    			
    		}
    	});
		$(this).closest("tr").remove();
	});
	
	
	//xóa hết sản phẩm trong giỏ hàng
	$(".btn-cart-clear").click(function() {
		$.ajax({
    		url:"/cart/clear",
    		success:function(response){
    			/*alert(response);*/
    			$("#cart-cnt").html(0);
    			$("#cart-amt").html(0);
    			$("table>tbody").html("");
    		}
    	});
	});
	
    $(".btn-add-to-cart").click(function() {
    	var id = $(this).closest("div").attr("data-id");
    	console.log("#yen debug id: "+id);
    	console.log("#yen debug id: "+id);
    	$.ajax({
    		url:"/cart/add/"+id,
    		success:function(response){
    			/*alert(response);*/
    			$("#cart-cnt").html(response[0]);
    			$("#cart-amt").html(new Intl.NumberFormat('vi-VI', { style: 'currency', currency: 'VND' }).format(response[1]));
    		}
    	});
    	
    	// bấm giỏ hàng chuyển image tới giở hàng
    	var img = $(this).closest(".thumbnail").find("a>img");
    	var options = {to:'#cart-img', className:'cart-fly'};
    	var cart_css = '.cart-fly {background-image: url("'+img.attr("src")+'");		background-size: 100% 100%;}';
    	$("style#cart-css").html(cart_css);
    	img.effect('transfer', options, 1000);
    	/*alert(img.attr("src"));*/
	});
	
	$(".btn-send").click(function() {
		var form = {
			id:$("#myModal #id").val(),
			to:$("#myModal #email").val(),
			body:$("#myModal #comments").val(),
			from:$("#myModal #sender").val()
		}
		$.ajax({
			url:"/product/send-to-friend",
			data: form,
			success:function(response){
				if (response) {
					$("[data-dismiss]").click();
					alert("Send thành công");
				} else {
					alert("Lỗi gửi mail");
				}
				
			}
		})
	});
	
	$(".btn-open-dialog").click(function() {
		var id = $(this).closest("div").attr("data-id");
		$("#myModal #id").val(id);
	});
	
	$(".btn-star").click(function() {
		var id = $(this).closest("div").attr("data-id");
		$.ajax({
			url:"/product/add-to-favo/"+id,
			success:function(response){
				if(response){
					alert("Đã thêm vào thành công");
				} else {
					alert("Đã có sẵn");
				}
			}
		})
	});
})