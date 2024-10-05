using Microsoft.EntityFrameworkCore.Migrations;

namespace TT.Lib.Migrations
{
    public partial class productkey : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Key",
                table: "Products",
                type: "nvarchar(63)",
                maxLength: 63,
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Key",
                table: "Products");
        }
    }
}
