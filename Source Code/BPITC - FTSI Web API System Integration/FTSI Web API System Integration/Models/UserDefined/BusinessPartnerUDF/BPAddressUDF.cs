using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.BusinessPartnerUDF
{
    public class BPAddressUDF
    {
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
