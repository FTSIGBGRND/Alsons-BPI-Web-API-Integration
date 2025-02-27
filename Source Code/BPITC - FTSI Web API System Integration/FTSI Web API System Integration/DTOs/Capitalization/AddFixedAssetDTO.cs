using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.DTOs.Capitalization
{
    public class AddFixedAssetDTO
    {
        [DefaultValue(Helpers.AsstStatus.New)]
        public char AsstStatus { get; set; }

        [MaxLength(20)]
        public string? AssetClass { get; set; }

        [MaxLength(50)]
        [Required]
        public string? ItemCode { get; set; }

        [MaxLength(200)]
        [Required]
        public string? ItemName { get; set; }

        [MaxLength(30)]
        public string? U_SalesAg { get; set; }

        [MaxLength(20)]
        public string? U_AssetAcct { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        [Required]
        public decimal? Quantity { get; set; } // Quantity

        [MaxLength(100)]
        public string? U_Maker { get; set; }

        [MaxLength(100)]
        public string? U_Model { get; set; }

        [MaxLength(10)]
        public string? U_ModYear { get; set; }

        [MaxLength(30)]
        public string? U_Serial { get; set; }

        [MaxLength(10)]
        public string? U_GDate { get; set; }

        [MaxLength(254)]
        public string? U_Chasis { get; set; }

        [MaxLength(254)]
        public string? U_Engine { get; set; }

        [MaxLength(20)]
        public string? U_Color { get; set; }

        [MaxLength(10)]
        public string? U_EquipID { get; set; }

        [MaxLength(10)]
        public string? U_LMADate { get; set; }

        [MaxLength(10)]
        public string? U_NMADate { get; set; }

        [MaxLength(254)]
        public string? U_AssInfo1 { get; set; }

        [MaxLength(254)]
        public string? U_AssInfo2 { get; set; }

        [MaxLength(254)]
        public string? U_AssInfo3 { get; set; }

        [MaxLength(10)]
        public string? U_AssLoc { get; set; }

        [MaxLength(254)]
        public string? U_AssLocM { get; set; }

        [MaxLength(20)]
        public string? U_AssRes { get; set; }

        [MaxLength(30)]
        public string? U_Contract { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? LineTotal { get; set; } // Line Total

        public DateOnly? PostDate { get; set; }

        [Required]
        public DateOnly? DprStart { get; set; }

        [Required]
        public int? UsefulLife { get; set; }

        [Required]
        [MaxLength(30)]
        public string? U_RefNum { get; set; }

    }
}
