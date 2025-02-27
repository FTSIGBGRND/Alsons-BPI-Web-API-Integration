using Microsoft.AspNetCore.Http.HttpResults;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.Retirement
{
    public class RetirementJournalTransactions
    {
        public Guid HeaderId { get; set; }
        public int? LineNum { get; set; } // Row Number
        [MaxLength(15)]
        public string? DprArea { get; set; } // Depreciation Area
        [MaxLength(254)]
        public string? JrnlMemo { get; set; } // Journal Remarks
        [MaxLength(20)]
        public string? ObjType { get; set; } // Object Type
        public int? LogInstanc { get; set; } // Log Instance
        public int? TransNum { get; set; } // Transaction Number
        [MaxLength(254)]
        public string? JrnlMemo1 { get; set; } // Cancellation Journal Remarks
        public int? TransNum1 { get; set; } // Cancellation Transaction No.

        [ForeignKey(nameof(HeaderId))]
        public RetirementHeader? Header { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
