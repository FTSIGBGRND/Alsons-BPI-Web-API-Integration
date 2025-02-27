using FTSI_Web_API_System_Integration.Models.UserDefined.BusinessPartnerUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner
{
    public class BPAddress : BPAddressUDF
    {

        public Guid HeaderId { get; set; }

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
        [Required]
        public char AdresType { get; set; } = 'S';
            
        public DateTime CreatedAt { get; set; }

        [ForeignKey(nameof(HeaderId))]
        public BusinessPartner? BusinessPartner { get; set; }

    }
}