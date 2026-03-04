<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs" Inherits="SIMPRE_BDI.DataBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 590px">
    <form id="form1" runat="server">
        <div style="height: 379px">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDatasourceMovies" DataTextField="title" DataValueField="idMovie" Height="49px" Width="173px">
            </asp:DropDownList>
            <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="RotatorSqlDataSource" Height="250px" ImageUrlField="url" Width="250px" />
            <asp:SqlDataSource ID="RotatorSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [url] FROM [Movie] WHERE ([idMovie] = @idMovie)">
                <SelectParameters>
                    <asp:SessionParameter Name="idMovie" SessionField="movieId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idReview" DataSourceID="ReviewsSqlDataSource" ForeColor="#333333" GridLines="None" Height="207px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" PageSize="3" Width="409px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="idReview" HeaderText="idReview" InsertVisible="False" ReadOnly="True" SortExpression="idReview" />
                    <asp:BoundField DataField="idMovie" HeaderText="idMovie" SortExpression="idMovie" />
                    <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                    <asp:BoundField DataField="evaluation" HeaderText="evaluation" SortExpression="evaluation" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDatasourceMovies" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" ProviderName="<%$ ConnectionStrings:MoviesConnectionString.ProviderName %>" SelectCommand="SELECT [idMovie], [title] FROM [Movie]"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:SqlDataSource ID="ReviewsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT * FROM [Review] WHERE ([idMovie] = @idMovie)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idMovie" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
