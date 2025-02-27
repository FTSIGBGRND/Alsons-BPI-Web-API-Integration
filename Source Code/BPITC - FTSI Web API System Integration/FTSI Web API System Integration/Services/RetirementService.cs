using FTSI_Web_API_System_Integration.DTOs.IncomingPayment;
using FTSI_Web_API_System_Integration.DTOs.Retirement;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.IncomingPayment;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.Retirement;
using Microsoft.AspNetCore.Http.HttpResults;

namespace FTSI_Web_API_System_Integration.Services
{
    public class RetirementService
    {
        private readonly IRetirementRepository _repository;

        public RetirementService(IRetirementRepository repository)
        {
            _repository = repository;
        }

        public async Task<RetirementHeader?> GetStatusAsync(Guid id)
        {
            return await _repository.GetStatusAsync(id);
        }

        public async Task<RetirementHeader> AddAsync(AddRetirementHeaderDTO dto)
        {
            DateTime createAt = DateTime.Now;

            List<RetirementLines> details = new List<RetirementLines>();

            foreach (AddRetirementLinesDTO detail in dto.Details)
            {
                details.Add(new()
                {
                    LineNum = detail.LineNum,
                    ItemCode = detail.ItemCode,
                    Partial = detail.Partial,
                    APC = detail.APC,
                    CreatedAt = createAt
                });

            }

            List<RetirementJournalTransactions> journalTrans = new List<RetirementJournalTransactions>();
            if (dto.JournalTransactions != null)
            {
                int lineNum = 0;
                foreach (AddRetirementJournalDTO journalTran in dto.JournalTransactions)
                {
                    journalTrans.Add(new ()
                    {
                        LineNum = lineNum,
                        DprArea = journalTran.DprArea,
                        CreatedAt = createAt
                    });

                    lineNum++;
                }
            }

            // Get Header
            RetirementHeader header = new()
            {
                DocType = dto.DocType,
                PostDate = dto.PostDate,
                DocDate = dto.DocDate,
                AssetDate = dto.AssetDate,
                Comments = dto.Comments,
                DocStatus = dto.DocStatus,
                JournalTransactions = journalTrans,
                Lines = details,
                CreatedAt = createAt,
                U_RefNum = dto.U_RefNum,
            };

            await _repository.AddAsync(header);
            await _repository.SaveChangesAsync();

            return header;
        }
    }
}