//check password
function check_password(password) {
    pwdRegex = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z]).{6,15}');
    return pwdRegex.test(password)
}

//check email
function check_email(email) {
    reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,8})$/;
    return reg.test(email);
}

//show verify count down
function show_count_down(obj, time, msg) {
    count_content = time + msg;
    $(obj).text(count_content)
}
