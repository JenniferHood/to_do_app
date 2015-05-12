require('spec_helper')


describe(Task) do
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('adds a task to the array of saved tasks') do
      test_task = Task.new({:description => "learn SQL"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it('lets you read the description out') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#assign_list") do
    it('assign a list to a task') do
      test_list = List.new({:name => "to_do", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "learn SQL"})
      test_task.save()
      test_task.assign_list(test_list.id)
      expect(test_task.list_id()).to(eq(test_list.id))
    end
  end

  describe("#==") do
    it("is the same task if it ihas the sasme description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end

end
