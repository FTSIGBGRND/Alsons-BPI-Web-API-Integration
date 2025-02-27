using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class ARCreditMemoRepository : IARCreditMemoRepository
    {
        private readonly FTDBWContext _ftdbwcontext;
        public ARCreditMemoRepository(FTDBWContext ftdbwcontext) => _ftdbwcontext = ftdbwcontext;
        public async Task AddAsync(ARCreditMemoHeader creditMemo)
        {
            await _ftdbwcontext.FTORIN.AddAsync(creditMemo);
        }

        public async Task<ARCreditMemoHeader> GetStatusAsync(Guid id)
        {
            return await _ftdbwcontext.FTORIN.FindAsync(id);
        }

        public void Update(ARCreditMemoHeader entity)
        {
            _ftdbwcontext.FTORIN.Update(entity);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _ftdbwcontext.SaveChangesAsync();
        }
    }
}
