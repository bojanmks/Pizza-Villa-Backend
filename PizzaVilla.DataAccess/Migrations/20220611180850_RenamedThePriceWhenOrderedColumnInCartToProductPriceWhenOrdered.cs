using Microsoft.EntityFrameworkCore.Migrations;

namespace PizzaVilla.DataAccess.Migrations
{
    public partial class RenamedThePriceWhenOrderedColumnInCartToProductPriceWhenOrdered : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PriceWhenOrdered",
                table: "Cart",
                newName: "ProductPriceWhenOrdered");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ProductPriceWhenOrdered",
                table: "Cart",
                newName: "PriceWhenOrdered");
        }
    }
}
