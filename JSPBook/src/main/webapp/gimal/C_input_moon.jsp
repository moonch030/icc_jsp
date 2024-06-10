<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>INPUT</title>
<script>
function validateForm() {
    var name = document.forms["inputForm"]["vName"].value;
    if (name.length > 10) {
        alert("이름은 10자 이하로 입력해주세요.");
        return false;
    }
    
    var phone = document.forms["inputForm"]["vPhone"].value;
    if (!/^\d{11}$/.test(phone)) {
        alert("전화번호는 정확히 11자리 숫자여야 합니다.");
        return false;
    }

    return true; // 폼이 유효하면 제출
}

// 숫자 이외의 입력을 방지
function restrictNonNumericInput(event) {
    if (event.key < '0' || event.key > '9') {
        event.preventDefault();
    }
}
</script>
</head>
<body>
<h2>서버프로그래밍 1학기 기말고사</h2>
<form name="inputForm" action="C_inputOK_moon.jsp" method="post" onsubmit="return validateForm()">
    Name: <input type="text" name="vName" maxlength="10" required><br>
    Phone: <input type="text" name="vPhone" maxlength="11" onkeypress="restrictNonNumericInput(event)" required><br>
    Group Number:
    <select name="nGroup" required>
        <option value="1">가족</option>
        <option value="2">학교</option>
        <option value="3">기타</option>
    </select><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
