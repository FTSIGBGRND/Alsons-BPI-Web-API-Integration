using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class ARInvoiceRepository : IARInvoiceRepository
    {
        private readonly FTDBWContext _ftdbwcontext;
        public ARInvoiceRepository(FTDBWContext ftdbwcontext) => _ftdbwcontext = ftdbwcontext;
        public async Task AddARInvoiceAsync(ARInvoiceHeader invoiceHeader)
        {
            await _ftdbwcontext.FTOINV.AddAsync(invoiceHeader);
        }

        public async Task<ARInvoiceHeader?> GetStatusAsync(Guid id)
        {
            return await _ftdbwcontext.FTOINV.FindAsync(id);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _ftdbwcontext.SaveChangesAsync();
        }

    }
}
