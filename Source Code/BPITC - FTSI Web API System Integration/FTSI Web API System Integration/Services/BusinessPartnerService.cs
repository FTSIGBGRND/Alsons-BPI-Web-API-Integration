using FTSI_Web_API_System_Integration.DTOs.BusinessPartner;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner;

namespace FTSI_Web_API_System_Integration.Services
{
    public class BusinessPartnerService
    {
        private readonly IBusinessPartnerRepository _repository;

        public BusinessPartnerService(IBusinessPartnerRepository repository)
        {
            _repository = repository;
        }

        public async Task<BusinessPartner?> GetStatusAsync(Guid id)
        {
            return await _repository.GetStatusAsync(id);
        }

        public async Task<BusinessPartner> AddAsync(BusinessPartnerHeaderDTO dto)
        {
            DateTime createAt = DateTime.Now;

            // Get Contact Person
            List<ContactEmployee> contactPersons = new List<ContactEmployee>();

            if (dto.ContactEmployees != null)
            {
                foreach (ContactEmployeeDTO contactPerson in dto.ContactEmployees)
                {
                    contactPersons.Add(new()
                    {
                        Name = contactPerson.Name,
                        FirstName = contactPerson.FirstName,
                        Position = contactPerson.Position,
                        Title = contactPerson.Title,
                        Profession = contactPerson.Profession,
                        Tel1 = contactPerson.Tel1,
                        Fax = contactPerson.Fax,
                        Notes1 = contactPerson.Notes1,
                        Email = contactPerson.Email,
                        Notes2 = contactPerson.Notes2,
                        Gender = contactPerson.Gender,
                        BirthDate = contactPerson.BirthDate,
                        CreatedAt = createAt,
                        U_Email3 = contactPerson.U_Email3,
                        U_NameLocal = contactPerson.U_NameLocal,
                        U_RefNum = contactPerson.U_RefNum,
                    });
                }
            }

            // Get Addresses
            List<BPAddress> addresses = new List<BPAddress>();

            if (dto.Addresses != null)
            {
                foreach (BPAddressDTO address in dto.Addresses)
                {
                    addresses.Add(new()
                    {
                        Address = address.Address,
                        Country = address.Country,
                        ZipCode = address.ZipCode,
                        City = address.City,
                        Street = address.Street,
                        State = address.State,
                        Block = address.Block,
                        AdresType = address.AdresType,
                        CreatedAt = createAt,
                        U_RefNum = address.U_RefNum,
                        U_BranchID = address.U_BranchID,
                        U_BranchName = address.U_BranchName,
                        U_LngAddrs1 = address.U_LngAddrs1,
                        U_LngAddrs2 = address.U_LngAddrs2,
                    });
                }
            }

            // Get Business Partner
            BusinessPartner bp = new()
            {
                CardCode = dto.CardCode,
                CardName = dto.CardName,
                CardFName = dto.CardFName,
                CardType = dto.CardType,
                GroupCode = dto.GroupCode,
                CmpPrivate = dto.CmpPrivate,
                ValidFor = dto.ValidFor,
                ECVatGroup = dto.ECVatGroup,
                AddId = dto.AddId,
                IndustryC = dto.IndustryC,
                ValidComm = dto.ValidComm,
                LicTradNum = dto.LicTradNum,
                DflAccount = dto.DflAccount,
                DflBranch = dto.DflBranch,
                GroupNum = dto.GroupNum,
                Addresses = addresses,
                ContactEmployees = contactPersons,
                CreatedAt = createAt,
                U_AgrAcvtyCd = dto.U_AgrAcvtyCd,
                U_BranchName = dto.U_BranchName,
                U_BranchID = dto.U_BranchID,
                U_RefNum = dto.U_RefNum,
                U_AssetSize = dto.U_AssetSize,
                U_BzLink = dto.U_BzLink,
                U_CrdRtUp = dto.U_CrdRtUp,
                U_CrdtAnlyst = dto.U_CrdtAnlyst,
                U_CrdtCtgry = dto.U_CrdtCtgry,
                U_CrdtRtDtl = dto.U_CrdtRtDtl,
                U_CrdtRtng = dto.U_CrdtRtng,
                U_Credibility = dto.U_Credibility,
                U_CreditTerm = dto.U_CreditTerm,
                U_CstmerVst = dto.U_CstmerVst,
                U_CstmNmSrch = dto.U_CstmNmSrch,
                U_CstmrCdHQ = dto.U_CstmrCdHQ,
                U_CstmrCtgry = dto.U_CstmrCtgry,
                U_CutmrNtr = dto.U_CutmrNtr,
                U_DescriptionPtn = dto.U_DescriptionPtn,
                U_DueDate = dto.U_DueDate,
                U_EcAcvtyCd = dto.U_EcAcvtyCd,
                U_Emplymnt = dto.U_Emplymnt,
                U_EqtyRt = dto.U_EqtyRt,
                U_EsblsmntDt = dto.U_EsblsmntDt,
                U_ExpsrLmt = dto.U_ExpsrLmt,
                U_FsclMnth = dto.U_FsclMnth,
                U_GrgCtgry = dto.U_GrgCtgry,
                U_GrntLttrDt = dto.U_GrntLttrDt,
                U_GrntrCd = dto.U_GrntrCd,
                U_HeadCount = dto.U_HeadCount,
                U_HoldingCR = dto.U_HoldingCR,
                U_IBllngPic = dto.U_IBllngPic,
                U_IDCrdAdd = dto.U_IDCrdAdd,
                U_InCbnt = dto.U_InCbnt,
                U_IntrdcrCd = dto.U_IntrdcrCd,
                U_IntrdcrNm = dto.U_IntrdcrNm,
                U_InvDvncDt = dto.U_InvDvncDt,
                U_InvoicePIC = dto.U_InvoicePIC,
                U_InvPrntPtrn = dto.U_InvPrntPtrn,
                U_InvRtio = dto.U_InvRtio,
                U_MngmntYrs = dto.U_MngmntYrs,
                U_MrtlStatus = dto.U_MrtlStatus,
                U_OffclCtgry = dto.U_OffclCtgry,
                U_OpePrd = dto.U_OpePrd,
                U_OrgnlGrpCd = dto.U_OrgnlGrpCd,
                U_OrgnlGrpNm = dto.U_OrgnlGrpNm,
                U_PostCode = dto.U_PostCode,
                U_PrfssnType = dto.U_PrfssnType,
                U_Privies = dto.U_Privies,
                U_PrtsCmpyCd = dto.U_PrtsCmpyCd,
                U_PrtsCmpyNm = dto.U_PrtsCmpyNm,
                U_PsicPsoc = dto.U_PsicPsoc,
                U_ReceiptDsp = dto.U_ReceiptDsp,
                U_RgstrdCptl = dto.U_RgstrdCptl,
                U_RiskConcern = dto.U_RiskConcern,
                U_SlsMngr10 = dto.U_SlsMngr10,
                U_SlsMngr9 = dto.U_SlsMngr9,
                U_SlsPicFl = dto.U_SlsPicFl,
                U_SlsPicOI = dto.U_SlsPicOI,
                U_SndngMthd = dto.U_SndngMthd,
                U_TcCRR = dto.U_TcCRR,
                U_VndrPrgrm = dto.U_VndrPrgrm,
                U_WhtRcvd = dto.U_WhtRcvd,
            };

            await _repository.AddAsync(bp);
            await _repository.SaveChangesAsync();

            return bp;
        }
    }
}