using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.IncomingPayment;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class IncomingPaymentRepository : IIncomingPaymentRepository
    {
        private readonly FTDBWContext _db;

        public IncomingPaymentRepository(FTDBWContext db)
        {
            _db = db;
        }

        public async Task AddAsync(IncomingPaymentHeader payment)
        {
            await _db.FTORCT.AddAsync(payment);
        }

        public async Task<IncomingPaymentHeader?> GetStatusAsync(Guid id)
        {
            return await _db.FTORCT.FindAsync(id);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }


    }
}
