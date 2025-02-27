using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.DTOs.Retirement
{
    public class AddRetirementHeaderDTO
    {
        [MaxLength(15)]
        [DefaultValue("NC")]
        [Required]
        [RegularExpression("^(NC|SC)$", ErrorMessage = "Invalid Value. Valid Values are NC and SC ( NC - Sales | SC - Scrapping)!")]
        public string? DocType { get; set; } = "NC"; // Document Type

        [Required]
        public DateOnly? PostDate { get; set; } // Posting Date

        [Required]
        public DateOnly? DocDate { get; set; } // Document Date

        [Required]
        public DateOnly? AssetDate { get; set; } // Asset Value Date

        [MaxLength(254)]
        public string? Comments { get; set; } // Remarks

        [RegularExpression("^(P|C)$", ErrorMessage = "Invalid Value. Valid Values are P and C ( P - Posted | C - Canceled)!")]
        public char? DocStatus { get; set; } = 'P'; // Document Status

        public string? U_RefNum { get; set; }


        public List<AddRetirementLinesDTO> Details { get; set; } = [];

        public List<AddRetirementJournalDTO> JournalTransactions { get; set; } = [];
    }
}
