using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARDownPayment;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.IncomingPayment;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.Items;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.JournalEntry;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.Retirement;
using Microsoft.EntityFrameworkCore;

namespace FTSI_Web_API_System_Integration.Data
{
    public class FTDBWContext : DbContext
    {
        public FTDBWContext(DbContextOptions<FTDBWContext> options) : base(options) { }

        #region AR Invoice
        public DbSet<ARInvoiceHeader> FTOINV { get; set; }
        public DbSet<ARInvoiceLines> FTINV1 { get; set; }
        public DbSet<ARInvoiceWTax> FTINV5 { get; set; }
        public DbSet<ARInvoiceDownPayment> FTINV9 { get; set; }
        #endregion

        #region AP Invoice
        public DbSet<APInvoiceHeader> FTOPCH { get; set; }
        public DbSet<APInvoiceLines> FTPCH1 { get; set; }
        public DbSet<APInvoiceWTax> FTPCH5 { get; set; }
        #endregion

        #region AR Credit Memo
        public DbSet<ARCreditMemoHeader> FTORIN { get; set; }
        public DbSet<ARCreditMemoLines> FTRIN1 { get; set; }
        public DbSet<ARCreditMemoWTax> FTRIN5 { get; set; }
        #endregion

        #region AP Credit Memo
        public DbSet<APCreditMemoHeader> FTORPC { get; set; }
        public DbSet<APCreditMemoLines> FTRPC1 { get; set; }
        public DbSet<APCreditMemoWTax> FTRPC5 { get; set; }
        #endregion

        #region AR Downpayment
        public DbSet<ARDownpaymentHeader> FTODPI { get; set; }
        public DbSet<ARDownpaymentLines> FTDPI1 { get; set; }
        public DbSet<ARDownpaymentWTax> FTDPI5 { get; set; }
        #endregion

        #region Incoming Payment
        public DbSet<IncomingPaymentHeader> FTORCT { get; set; }
        public DbSet<IncomingPaymentInvoices> FTRCT2 { get; set; }
        #endregion

        #region Business Partner
        public DbSet<BusinessPartner> FTOCRD { get; set; }
        public DbSet<ContactEmployee> FTOCPR { get; set; }
        public DbSet<BPAddress> FTCRD1 { get; set; }
        #endregion

        #region Items
        public DbSet<Item> FTOITM { get; set; }

        public DbSet<DepreciationParameters> FTITM7 { get; set; }

        #endregion

        #region Capitalization
        public DbSet<AssetDocument> FTOACQ { get; set; }
        public DbSet<AssetDocumentLine> FTACQ1 { get; set; }
        #endregion

        #region Journal Entry
        public DbSet<JournalEntry> FTOJDT { get; set; }

        public DbSet<JournalEntryLine> FTJDT1 { get; set; }
        #endregion

        #region Retirement
        public DbSet<RetirementHeader> FTORTI { get; set; }
        public DbSet<RetirementLines> FTRTI1 { get; set; }
        public DbSet<RetirementJournalTransactions> FTRTI2 { get; set; }
        #endregion

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            // Journal Entry
            modelBuilder.Entity<JournalEntryLine>()
                .HasKey(l => new { l.HeaderId, l.LineId });

            // Retirement
            modelBuilder.Entity<RetirementLines>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            modelBuilder.Entity<RetirementJournalTransactions>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            // Capitalization
            modelBuilder.Entity<AssetDocumentLine>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            // AR Downpayment
            modelBuilder.Entity<ARDownpaymentWTax>()
               .HasKey(l => new { l.HeaderId, l.LineNum });

            modelBuilder.Entity<ARDownpaymentLines>()
               .HasKey(l => new { l.HeaderId, l.LineNum });

            // AR CreditMemo
            modelBuilder.Entity<ARCreditMemoWTax>()
               .HasKey(l => new { l.HeaderId, l.LineNum });

            modelBuilder.Entity<ARCreditMemoLines>()
               .HasKey(l => new { l.HeaderId, l.LineNum });

            // AP Credit Memo
            modelBuilder.Entity<APCreditMemoWTax>()
              .HasKey(l => new { l.HeaderId, l.LineNum });

            modelBuilder.Entity<APCreditMemoLines>()
               .HasKey(l => new { l.HeaderId, l.LineNum });

            // AR Invoice
            modelBuilder.Entity<ARInvoiceWTax>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            modelBuilder.Entity<ARInvoiceLines>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            // AP Invoice
            modelBuilder.Entity<APInvoiceWTax>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            modelBuilder.Entity<APInvoiceLines>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            modelBuilder.Entity<ARInvoiceDownPayment>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            // Incoming Payment
            modelBuilder.Entity<IncomingPaymentInvoices>()
                .HasKey(l => new { l.HeaderId, l.LineNum });

            // Business Partner
            modelBuilder.Entity<BPAddress>()
                .HasKey(l => new { l.HeaderId, l.Address });

            modelBuilder.Entity<ContactEmployee>()
                .HasKey(l => new { l.HeaderId, l.Name });

            // Items
            modelBuilder.Entity<DepreciationParameters>()
                .HasKey(l => new { l.HeaderId, l.VisOrder, l.ItemCode });
        }
    }
}
