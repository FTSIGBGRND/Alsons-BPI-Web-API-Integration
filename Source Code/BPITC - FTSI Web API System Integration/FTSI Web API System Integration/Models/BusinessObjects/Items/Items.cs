using FTSI_Web_API_System_Integration.Models.UserDefined.ItemUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.Items
{
    public class Item : ItemsUDF
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }

        [MaxLength(50)]
        [Required]
        public string? ItemCode { get; set; }

        [MaxLength(200)]
        [Required]
        public string? ItemName { get; set; }

        public char AsstStatus { get; set; } = Helpers.AsstStatus.New;

        [MaxLength(20)]
        public string? AssetClass { get; set; }

        public char ItemType { get; set; } = Helpers.ItemType.Items;

        public DateTime CreatedAt { get; set; }

        public char IntegrationStatus { get; set; } = 'P';

        public List<DepreciationParameters>? DepreciationParameters { get; set; } = [];
    }
}
