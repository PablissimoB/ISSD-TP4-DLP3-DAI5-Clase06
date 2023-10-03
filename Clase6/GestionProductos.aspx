<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionProductos.aspx.cs" Inherits="Clase6.GestionProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Atras</asp:HyperLink>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreCategoria" DataValueField="idCategoria" Width="287px">
            </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
            <br />
            <br />
            Filtro<br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreCategoria" DataValueField="idCategoria" Width="318px">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Filtrar" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Desfiltrar" />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                    <asp:BoundField DataField="idCategoria" SortExpression="idCategoria" />
                    <asp:BoundField DataField="nombreCategoria" HeaderText="Categoría" SortExpression="nombreCategoria" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/icons/select.png" ShowSelectButton="True" ControlStyle-Width="20" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [Productos] WHERE [id] = @id" InsertCommand="INSERT INTO [Productos] ([descripcion], [idCategoria], [precio]) VALUES (@descripcion, @idCategoria, @precio)" ProviderName="<%$ ConnectionStrings:conexion.ProviderName %>" SelectCommand="SELECT Productos.id, Productos.descripcion, Productos.idCategoria, Productos.precio, Categorias.nombreCategoria FROM Productos INNER JOIN Categorias ON Productos.idCategoria = Categorias.idCategoria" UpdateCommand="UPDATE [Productos] SET [descripcion] = @descripcion, [idCategoria] = @idCategoria, [precio] = @precio WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                    <asp:Parameter Name="precio" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCategoria" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox2" Name="precio" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT * FROM [Categorias]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
