using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.DTOs.Retirement
{
    public class AddRetirementLinesDTO
    {
        [Required]
        public int? LineNum { get; set; } // Row Number

        [MaxLength(50)]
        [Required]
        public string? ItemCode { get; set; } // Item Code

        [RegularExpression("^(N|Y)$", ErrorMessage = "Invalid Value. Valid Values are Y and N ( Y - Yes | N - No)!")]
        [DefaultValue('N')]
        public char? Partial { get; set; } = 'N'; // Partial

        [Column(TypeName = "decimal(19, 6)")]
        public decimal? APC { get; set; } // APC
    }
}
