using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.DocumentUDF
{
    public class DocumentLinesUDF
    {
        #region User-Defined Fields
        [MaxLength(30)]
        public string? U_RefNum { get; set; }

        [MaxLength(255)]
        public string? U_BaseRef { get; set; }

        public int? U_BaseType { get; set; }
        public int? U_BaseLine { get; set; }

        public string? U_LngDscrptn { get; set; }

        [MaxLength(10)]
        public string? U_Period { get; set; }
        #endregion
    }
}
