require ('pg')
require ('pry')

class SqlRunner

  def Self.run(sql, values =[])
    begin
      db = PG.connect({dbname: 'Spending_tracker', host: 'localhost'})
      db.prepare("Query", sql)
      result = db.exec_prepare("Query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
