using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.Items
{
    public class DepreciationParameters
    {
        public Guid HeaderId { get; set; }

        [MaxLength(50)]
        [Required]
        public string? ItemCode { get; set; }

        [MaxLength(10)]
        public string? PrediodCat { get; set; }

        [MaxLength(15)]
        public string? DprArea { get; set; }

        [Required]
        public int? VisOrder { get; set; }

        [Required]
        public int? UsefulLife { get; set; }

        [Required]
        public DateOnly? DprStart { get; set; }

        public DateOnly? DprEnd { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? RemainLife { get; set; }

        [MaxLength(15)]
        public string? DprType { get; set; }

        [MaxLength(15)]
        public string? DprTypeC { get; set; }

        public int? UsefulLfeC { get; set; }
        public int? LogInstanc { get; set; }

        [MaxLength(20)]
        public string? ObjType { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? RemainDays { get; set; }

        public int? TotalUnits { get; set; }

        public int? RemainUnit { get; set; }

        public int? StanUnit { get; set; }

        public DateTime CreatedAt { get; set; }

        [ForeignKey("HeaderId")]
        public Item? Item { get; set; }
    }
}
