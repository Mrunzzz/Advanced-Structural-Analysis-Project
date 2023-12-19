figure()
% syms x
% L = 1.2369e+04
% fplot(- 0.0018*x^2 + 47.7078*x - 223946.0, [0 L])
% hold on
% fplot([0 L/2 L],subs(- 0.0018*x^2 + 47.7078*x - 223946.0,[0 L/2 L]),"*")
% h = plot([0 L/2 L],subs(- 0.0018*x^2 + 47.7078*x - 223946.0,[0 L/2 L]),"*")
% 
% 
% xlabel("Coordinate x")
% ylabel("Bending Moment Mz")


% syms x
% L = 1.2369e+04
% fn =  - 0.0018*x^2 + 32.2983*x;
% fplot(fn, [0 L])
% hold on
% fplot([0 L/2 L],subs(fn,[0 L/2 L]),"*")
% h = plot([0 L/2 L],subs(fn,[0 L/2 L]),"*")
% 
% 
% xlabel("Coordinate x")
% ylabel("Bending Moment Mz")

syms x
L = 12369.41827
fn = - 0.0018*x^2 + 41.2614*x - 234975.0;
fplot(fn, [0 L],"-")
hold on
fplot([0 L/2 L],subs(fn,[0 L/2 L]),"*")
h = plot([0 L/2 L],subs(fn,[0 L/2 L]),"*")

% syms x
% L = 5000
% fn = 18.9192*x - 91745.0;
% fplot(fn, [0 L])
% hold on
% fplot([0 L],subs(fn,[0 L]),"*")
% h = plot([0 L],subs(fn,[0 L]),"*")

% syms x
% L = 8000
% fn = - 0.0025*x^2 + 18.9192*x - 877.709;
% fplot(fn, [0 L])
% hold on
% xx = solve(diff(- 0.0025*x^2 + 18.9192*x - 877.709,x)==0)
% fplot([0 xx L],subs(fn,[0 xx L]),"*")
% h = plot([0 xx L],subs(fn,[0 xx L]),"*")
% 
% syms x
% L = 3000
% fn = - 21.0808*x - 2850.84;
% fplot(fn, [0 L])
% hold on
% fplot([0 L],subs(fn,[0 L]),"*")
% h = plot([0 L],subs(fn,[0 L]),"*")


xlabel("Coordinate x")
ylabel("Bending Moment Mz")