using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.DTOs.BusinessPartner
{
    public class ContactEmployeeDTO
    {
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
        [RegularExpression("^(M|F|E|X)$", ErrorMessage = "Invalid Value. Document Type Valid Values are M - Male, F - Female, E - Empty, * - Masked!")]
        [DefaultValue('E')]
        public char Gender { get; set; } = 'E';

        public DateOnly? BirthDate { get; set; }

        [MaxLength(255)]
        public string? U_NameLocal { get; set; }

        [MaxLength(255)]
        public string? U_Email3 { get; set; }

        [MaxLength(30)]
        public string? U_RefNum { get; set; }
    }
}
