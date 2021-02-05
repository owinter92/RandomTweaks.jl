@testset "load_file_line_by_line" begin
    file_txt = ["1","2","","a","b c","d e f",""]

    @test load_file_line_by_line("data/file.txt") == file_txt
    #@test_throws ErrorException("File a does not exist.") load_file_line_by_line("a")
end
