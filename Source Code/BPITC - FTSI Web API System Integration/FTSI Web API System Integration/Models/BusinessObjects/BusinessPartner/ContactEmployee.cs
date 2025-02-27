using FTSI_Web_API_System_Integration.Models.UserDefined.BusinessPartnerUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner
{
    public class ContactEmployee : ContactEmployeeUDF
    {
        public Guid HeaderId { get; set; }

        [MaxLength(50)]
        public string? Name { get; set; }

        [MaxLength(50)]
        public string? FirstName { get; set; }

        [MaxLength(90)]
        public string? Position { get; set; }

        [MaxLength(10)]
        public string? Title { get; set; }

        [MaxLength(50)]
        public string? Profession { get; set; }

        [MaxLength(50)]
        public string? Tel1 { get; set; }

        [MaxLength(50)]
        public string? Fax { get; set; }

        [MaxLength(100)]
        public string? Notes1 { get; set; }

        [MaxLength(100)]
        public string? Email { get; set; }

        [MaxLength(100)]
        public string? Notes2 { get; set; }

        /// <value>
        /// M - Male, F - Female, E - Empty, * - Masked
        /// </value>
        public char Gender { get; set; } = 'E';

        public DateOnly? BirthDate { get; set; }

        public DateTime CreatedAt { get; set; }

        [ForeignKey(nameof(HeaderId))]
        public BusinessPartner? BusinessPartner { get; set; }
    }
}
