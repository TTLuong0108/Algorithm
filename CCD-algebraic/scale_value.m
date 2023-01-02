function theta = scale_value(goc,upper_limit,lower_limit)

theta = goc;
if(goc >= upper_limit)
    theta = upper_limit;
else if(goc <= lower_limit)
    theta = lower_limit;
    end
end

end