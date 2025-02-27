using FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.DTOs.BusinessPartner
{
    public class BPAddressDTO
    {
        [MaxLength(50)]
        [Required]
        public string? Address { get; set; }

        [MaxLength(3)]
        public string? Country { get; set; }

        [MaxLength(20)]
        public string? ZipCode { get; set; }

        [MaxLength(100)]
        public string? City { get; set; }

        [MaxLength(3)]
        public string? State { get; set; }

        [MaxLength(100)]
        public string? Street { get; set; }

        [MaxLength(100)]
        public string? Block { get; set; }

        /// <value>
        /// S - Ship To, B - Bill To
        /// </value>
        [RegularExpression("^(S|B)$", ErrorMessage = "Invalid Value. Document Type Valid Values areS - Ship To, B - Bill To!")]
        [Required]
        [DefaultValue('S')]
        public char AdresType { get; set; } = 'S';

        [MaxLength(255)]
        public string? U_BranchID { get; set; }

        [MaxLength(255)]
        public string? U_BranchName { get; set; }

        [MaxLength(255)]
        public string? U_LngAddrs1 { get; set; }

        [MaxLength(255)]
        public string? U_LngAddrs2 { get; set; }

        [MaxLength(30)]
        public string? U_RefNum { get; set; }
    }
}
