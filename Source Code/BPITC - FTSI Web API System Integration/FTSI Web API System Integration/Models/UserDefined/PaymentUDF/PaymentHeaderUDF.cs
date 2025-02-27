using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.PaymentUDF
{
    public class PaymentHeaderUDF
    {
        [MaxLength(30)]
        public string? U_RefNum { get; set; }

        [MaxLength(100)]
        public string? U_FileName { get; set; }

        /// <summary>
        /// Status of SAP and Web API Integration.
        /// </summary>
        /// <value>
        /// P - Pending, S - Success, E - Error
        /// </value>
        public char IntegrationStatus { get; set; } = 'P';

        public string? IntegrationMessage { get; set; }
    }
}
