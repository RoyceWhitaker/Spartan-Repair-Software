Public Class Form1
    Private Sub lblName_Click(sender As Object, e As EventArgs) Handles lblName.Click

    End Sub

    Private Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click

        txtbox.Text = "Hello " & txtbox.Text

    End Sub

    Private Sub btnmessage_Click(sender As Object, e As EventArgs) Handles btnmessage.Click
        MessageBox.Show("Hello " & txtbox.Text,
                        "Hello " & txtbox.Text)
    End Sub

    Private Sub btnExit_Click(sender As Object, e As EventArgs) Handles btnExit.Click
        Me.Close()
    End Sub

    Private Sub btnAddValues_Click(sender As Object, e As EventArgs) Handles btnAddValues.Click

        Try

            Dim firstNum As Integer = CInt(txtAddVal1.Text)
            Dim secondNum As Integer = CInt(txtAddValue2.Text)

            Dim sum = firstNum + secondNum

            txtSumAnswer.Text = CStr(sum)

        Catch ex As System.InvalidCastException

            MessageBox.Show("Please enter numbers to sum",
                        "error")

        Catch ex As Exception

            MessageBox.Show("An unknown error has occured",
                            "Error")

        End Try

    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles txtDivideAnswer.TextChanged

    End Sub

    Private Sub btnDivideValues_Click(sender As Object, e As EventArgs) Handles btnDivideValues.Click
        Dim firstNum As Decimal = CDec(txtDivide1.Text)
        Dim secondNum As Decimal = CDec(txtDivide2.Text)
        Dim intSolution As Integer = CType(firstNum / secondNum, Integer)

        txtDivideAnswer.Text = CStr(intSolution)
    End Sub
End Class
