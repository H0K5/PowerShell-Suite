Private Sub cmdKirimGET_Click()
    Dim strResult As String
    Dim objHTTP As Object
    Dim URL As String
    Set objHTTP = CreateObject("WinHttp.WinHttpRequest.5.1")
    URL = "http://localhost/search.php"
    objHTTP.Open "GET", URL, False
    objHTTP.setRequestHeader "User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)"
    objHTTP.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
    objHTTP.send ("keyword=php")
    strResult = objHTTP.responseText
    Worksheets("Sheet1").Range("A10:A10") = strResult
End Sub
