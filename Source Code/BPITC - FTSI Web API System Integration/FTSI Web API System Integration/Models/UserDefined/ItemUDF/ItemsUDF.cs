using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.ItemUDF
{
    public class ItemsUDF
    {
        [MaxLength(30)]
        [Required]
        public string? U_RefNum { get; set; }

        [MaxLength(30)]
        public string? U_SalesAg { get; set; }

        [MaxLength(20)]
        public string? U_AssetAcct { get; set; }

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


    }
}
