using FTSI_Web_API_System_Integration.Models.UserDefined.DocumentUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.Base.Documents
{
    public class DocumentDownpaymentsToDraw : DocumentDownPaymentUDF
    {
        public Guid HeaderId { get; set; }

        [Required]
        public int? LineNum { get; set; } = 0;

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? DrawnSum { get; set; }

        public DateTime CreatedAt { get; set; }



    }
}
