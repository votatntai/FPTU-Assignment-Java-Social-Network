function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#show-image').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#upload").change(function () {
    readURL(this);
});

$(function () {
    let form = $("#form-login");
    form.on('submit', function (e) {
        e.preventDefault();
        let url = form.attr('action');
        let data = form.serialize();
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function (res) {
                if (res === "Error") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Sorry',
                        text: 'Username or password is incorrect',
                    });
                } else if (res === "Success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Successful',
                        text: 'Login successful',
                    });
                    setTimeout(function () {
                        location.href = "index.jsp";
                    }, 2000);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    });
});

$(function () {
    let form = $("#form-register");
    form.on('submit', function (e) {
        e.preventDefault();
        let url = form.attr('action');
        let data = form.serialize();
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function (res) {
                if (res === "Duplicate") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Sorry',
                        text: 'This email is already taken',
                    });
                } else if (res === "Password does not match") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Sorry',
                        text: 'Password does not match',
                    });
                } else if (res === "Success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Successful',
                        text: 'Register account successful',
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    });
});

$(function () {
    let form = $("#form-create-post");
    form.on('submit', function (e) {
        var image = $('#form-create-post input#upload').val();
        $('#form-create-post input#image').attr('value', image.slice(12));
        e.preventDefault();
        let url = form.attr('action');
        let data = form.serialize();
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function (res) {
                if (res === "403") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Sorry',
                        text: 'You must be logged in to use this feature',
                    });
                } else if (res === "Success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Successfull',
                        text: 'Your post has been successfully created',
                    });
                } else if (res === "Error") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Unspecified error, please contact support',
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    });
});
