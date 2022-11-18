<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CaptchaLogin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <title></title>
    
    <style type="text/css">
        .center {
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">

        </asp:ScriptManager>
        <div class="container my-3">
            <div class="row">
                <div class="col-md-6  mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Images/login%20(1).png" width="150" />
                                        <%--<asp:Label ID="Label2" runat="server" Text="Welcome to Log Form"></asp:Label>--%>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <hr />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="UserName"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="Invalid UserName" ForeColor="Red" ValidationGroup="Send"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3">
                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Invalid Password" ForeColor="Red" ValidationGroup="Send"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3 d-flex form-control">
                                        <%--<asp:TextBox ID="TextBox3" runat="server" TextMode="Password" placeholder="password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Invalid Password" ForeColor="Red" ValidationGroup="Send"></asp:RequiredFieldValidator>--%>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Image ID="imgCaptcha" runat="server" CssClass="me-5" style="height: 30px; width: 100px;" />
                                                <asp:Button ID="Button3" runat="server"  Text="Refresh" OnClick="Button3_Click"  />                                            
                                                 <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="mb-3 d-flex">
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Enter your captcha here"></asp:TextBox>
                                    </div>
                                    <div class="mb-3 d-grid gap-2">
                                        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" ValidationGroup="Send" CssClass="btn btn-dark" />
                                    </div>
                                    <div class="mb-3 d-grid gap-2">
                                        <asp:Button ID="Button2" CssClass="btn btn-dark" runat="server" Text="Register" />
                                    </div>
                                    <div class="mb-3 d-grid gap-2">
                                        <center>
                                            <asp:LinkButton ID="LinkButton1" runat="server" href="forgetpass.aspx">ForgetPassword</asp:LinkButton>
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
