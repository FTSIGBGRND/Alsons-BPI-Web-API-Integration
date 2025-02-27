using FTSI_Web_API_System_Integration.Models.UserDefined.BusinessPartnerUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner
{
    public class BusinessPartner : BusinessPartnerUDF
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }

        [MaxLength(15)]
        [Required]
        public string? CardCode { get; set; }

        [MaxLength(100)] 
        [Required]
        public string? CardName { get; set; }

        [MaxLength(100)]
        public string? CardFName { get; set; }

        /// <value>
        /// C - Customer, S - Vendor, L - Lead
        /// </value>
        public char CardType { get; set; } = 'C';

        public int? GroupCode { get; set; }

        /// <value>
        /// C - Company, 
        /// I - Private, 
        /// G - Government, 
        /// E - Employee
        /// </value>
        public char CmpPrivate { get; set; } = 'C';

        public char ValidFor { get; set; } = 'Y';

        [MaxLength(8)]
        public string? ECVatGroup { get; set; }

        [MaxLength(64)]
        public string? AddId { get; set; }

        public int? IndustryC { get; set; }

        [MaxLength(30)]
        public string? ValidComm { get; set; }

        [MaxLength(32)]
        public string? LicTradNum { get; set; }

        [MaxLength(50)]
        public string? DflAccount { get; set; }

        public int? GroupNum { get; set; }

        public string? DflBranch { get; set; }

        public char? WTLiable { get; set; }

        [MaxLength(100)]
        public string? E_mail { get; set; }

        [MaxLength(50)]
        public string? Phone1 { get; set; }

        [MaxLength(90)]
        public string? CntctPrsn { get; set; }

        public DateTime CreatedAt { get; set; }

        public List<BPAddress>? Addresses { get; set; } = [];

        public List<ContactEmployee> ContactEmployees { get; set; } = [];
    }
}
