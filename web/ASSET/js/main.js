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
                        text: 'Register account successful, please check your mail to verify your accountl',
                    });
                    setTimeout(function () {
                        location.href = "confirm.jsp";
                    }, 3000);
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

$(function () {
    let form = $("#form-verify");
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
                        text: 'Code does not match',
                    });
                } else if (res === "Success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Successful',
                        text: 'Your account has been verified',
                    });
                    setTimeout(function () {
                        location.href = "login.jsp";
                    }, 3000);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    });
});

$(function () {
    let form = $("#delete-post");
    form.on('submit', function (e) {
        e.preventDefault();
        let url = form.attr('action');
        let data = form.serialize();
        Swal.fire({
            title: 'Delete this post?',
            icon: 'info',
            text: "You won't be able to revert this!",
            showCancelButton: true,
            confirmButtonText: `Delete`,
            confirmButtonColor: '#d33',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    success: function (res) {
                        if (res === "Error") {
                            Swal.fire({
                                icon: 'error',
                                title: 'Sorry',
                                text: 'An unknown error when deleting posts, please contact the administrator',
                            });
                        } else if (res === "Success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Successful',
                                text: 'Your post has been successfully deleted',
                            });
                            setTimeout(function () {
                                location.reload();
                            }, 2000);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Sorry',
                            text: 'An unknown error when deleting posts, please contact the administrator',
                        });
                    }
                });
            }
        })
    });
});

$(function () {
    let form = $(".delete-comment");
    form.on('submit', function (e) {
        e.preventDefault();
        let url = $(this).attr("action");
        let data = $(this).serialize();
        let comment = $(this);
        Swal.fire({
            title: 'Delete your comment?',
            icon: 'info',
            text: "You won't be able to revert this!",
            showCancelButton: true,
            confirmButtonText: `Delete`,
            confirmButtonColor: '#d33',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    success: function (res) {
                        if (res === "Error") {
                            Swal.fire({
                                icon: 'error',
                                title: 'Sorry',
                                text: 'An unknown error when deleting comment, please contact the administrator',
                            });
                        } else if (res === "Success") {
                            comment.parents(".card-body").fadeOut(1000);
                            setTimeout(function () {
                                comment.parents(".card-body").remove();
                            }, 1000);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Sorry',
                            text: 'An unknown error when deleting comment, please contact the administrator',
                        });
                    }
                });
            }
        })
    });
});

$(function () {
    let form = $(".form-reaction");
    form.on('submit', function (e) {
        e.preventDefault();
        let url = $(this).attr('action');
        let data = $(this).serialize();
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function (res) {
                var post = JSON.parse(res);
                $('#likes').html(post.likes);
                $('#dislikes').html(post.dislikes);
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    });
});
