//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DiscreteMathCourseApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserTestResult
    {
        public int Id { get; set; }
        public int TestId { get; set; }
        public int Result { get; set; }
        public string UserName { get; set; }
    
        public virtual Test Test { get; set; }
        public virtual User User { get; set; }
    }
}
