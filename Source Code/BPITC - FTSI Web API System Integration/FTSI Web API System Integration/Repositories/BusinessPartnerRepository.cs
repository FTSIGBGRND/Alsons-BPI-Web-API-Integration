using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.IncomingPayment;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class BusinessPartnerRepository : IBusinessPartnerRepository
    {
        private readonly FTDBWContext _db;

        public BusinessPartnerRepository(FTDBWContext db)
        {
            _db = db;
        }

        public async Task AddAsync(BusinessPartner bp)
        {
            await _db.FTOCRD.AddAsync(bp);
        }

        public async Task<BusinessPartner?> GetStatusAsync(Guid id)
        {
            return await _db.FTOCRD.FindAsync(id);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }


    }
}
