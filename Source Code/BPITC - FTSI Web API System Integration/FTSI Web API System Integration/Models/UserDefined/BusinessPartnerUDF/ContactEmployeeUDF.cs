using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.BusinessPartnerUDF
{
    public class ContactEmployeeUDF
    {
        [MaxLength(255)]
        public string? U_NameLocal { get; set; }

        [MaxLength(255)]
        public string? U_Email3 { get; set; }

        [MaxLength(30)]
        public string? U_RefNum { get; set; }
    }
}
