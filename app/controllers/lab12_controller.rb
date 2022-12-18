class Lab12Controller < ApplicationController
  def input
  end

  def show
    @input = params[:inpt]
    error
    @result = [tog(@input), max(tog(@input))]
  end

  private

  def max(array)
    arr = array.clone
    s = ''
    arr.sort_by!(&:size).map { |el| s += "#{el.join(' ')}, " if el.size == arr[-1].size }
    s[0...s.length - 2]
  end

  # разделение на подпоследовательности
  def cons(mas)
    a = []
    mas.each { |x| (2..x.size).each { |n| x.each_cons(n) { |el| a.push(el) } } }
    a
  end

  def tog(mas)
    arr = []
    a = []
    mas.split.map(&:to_i).each do |x|
      unless arr.push(x) == arr.sort
        a.push(arr.first(arr.size - 1))
        arr = [arr.pop]
      end
    end
    cons(a.push(arr).select { |x| x.length > 1 })
  end
  
  def error
    params[:inpt].split(' ').each do |x|
      next unless x.match(/^-?[0-9]\d*$/).nil?

      return redirect_to root_path, notice: "Вы ввели не число / не целое число: #{x}"
    end
    redirect_to root_path, notice: 'Вы ввели меньше 10 чисел' if params[:inpt].split(' ').size < 10
  end

end
