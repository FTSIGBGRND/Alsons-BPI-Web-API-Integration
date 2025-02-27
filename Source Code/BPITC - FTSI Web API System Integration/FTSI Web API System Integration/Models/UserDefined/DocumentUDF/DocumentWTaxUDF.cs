using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.DocumentUDF
{
    public class DocumentWTaxUDF
    {
        #region User-Defined Fields
        [MaxLength(30)]
        public string? U_RefNum { get; set; }
        #endregion 
    }
}
