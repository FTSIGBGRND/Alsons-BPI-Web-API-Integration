using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.DTOs.Retirement
{
    public class AddRetirementJournalDTO
    {
        [MaxLength(15)]
        [Required]
        public string? DprArea { get; set; } // Depreciation Area
    }
}
