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
    
    public partial class UserControlPoint
    {
        public int Id { get; set; }
        public int ControlPointId { get; set; }
        public string UserName { get; set; }
        public string Answer { get; set; }
        public string AnswerLink { get; set; }
        public Nullable<int> Result { get; set; }
    
        public virtual ControlPoint ControlPoint { get; set; }
        public virtual User User { get; set; }
    }
}
