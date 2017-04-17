module AdminHelper
        
def recup_all_modules(l)
    @modules = Module.find_by(lecturer_id: @l.lecturer_id )
end
end
