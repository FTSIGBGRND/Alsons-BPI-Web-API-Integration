using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.JournalEntryUDF
{
    public class JournalEntryHeaderUDF
    {
        [MaxLength(20)]
        public string? U_DocNum { get; set; }

        [MaxLength(30)]
        [Required]
        public string? U_RefNum { get; set; }

        public char IntegrationStatus { get; set; } = 'P';

        public string? IntegrationMessage { get; set; }
    }
}
