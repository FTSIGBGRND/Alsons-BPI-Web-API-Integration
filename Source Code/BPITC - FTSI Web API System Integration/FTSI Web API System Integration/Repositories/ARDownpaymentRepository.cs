using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARDownPayment;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class ARDownpaymentRepository : IARDownpaymentRepository
    {
        private readonly FTDBWContext _db;
        public ARDownpaymentRepository(FTDBWContext db) => _db = db;
        public async Task AddAsync(ARDownpaymentHeader data)
        {
            await _db.FTODPI.AddAsync(data);
        }

        public async Task<ARDownpaymentHeader?> GetStatusAsync(Guid id)
        {
            return await _db.FTODPI.FindAsync(id);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }
    }
}
