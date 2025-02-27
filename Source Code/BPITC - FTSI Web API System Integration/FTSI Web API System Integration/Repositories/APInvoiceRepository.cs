using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class APInvoiceRepository : IAPInvoiceRepository
    {
        private readonly FTDBWContext _db;
        public APInvoiceRepository(FTDBWContext db) => _db = db;
        public async Task AddAsync(APInvoiceHeader invoiceHeader)
        {
            await _db.FTOPCH.AddAsync(invoiceHeader);
        }

        public async Task<APInvoiceHeader?> GetStatusAsync(Guid id)
        {
            return await _db.FTOPCH.FindAsync(id);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }

    }
}
