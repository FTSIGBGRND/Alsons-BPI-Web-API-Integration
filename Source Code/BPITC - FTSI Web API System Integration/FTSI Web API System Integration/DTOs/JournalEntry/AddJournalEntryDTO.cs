using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.DTOs.JournalEntry
{
    public class AddJournalEntryDTO
    {

        [MaxLength(20)]
        [Required]
        public string? U_DocNum { get; set; }

        [Required]
        public DateOnly? RefDate { get; set; }

       [MaxLength(254)]
        public string? Memo { get; set; }

        [MaxLength(30)]
        [Required]
        public string? U_RefNum { get; set; }

        [Required]
        public List<AddJournalEntryLinesDTO> Lines { get; set; } = [];
    }
}
