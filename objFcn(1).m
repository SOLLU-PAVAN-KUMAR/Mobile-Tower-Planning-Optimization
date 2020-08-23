function f = objFcn(pts, R,lambda)
N = length(R);
f = 0;
for i = 1:N-1
  for j = i+1:N
    [areatotal] = area(pts(:,i),R(i),pts(:,j),R(j));
    if isequal(pts(:,i),pts(:,j))
      f = f + areatotal + 1/(1e-8);
    else
      f = f + areatotal + 1/40 * 1/((norm(pts(:,i)-pts(:,j)))^2);
    end
    f = f + lambda*norm(pts(:,i) - pts(:,j))^2;
  end
end
end